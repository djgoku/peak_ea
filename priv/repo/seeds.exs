# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PeckEa.Repo.insert!(%PeckEa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

NimbleCSV.define(DataSFParser, separator: ",", escape: "\"")

{:ok, conn} = Exqlite.Sqlite3.open("peck_ea_dev.db")

:ok =
  Exqlite.Sqlite3.execute(
    conn,
    "create virtual table search using fts3 (applicant text, facility_type text, location_description text, status text, food_items text, vendor_id integer)"
  )

{:ok, statement} =
  Exqlite.Sqlite3.prepare(
    conn,
    "insert into search (applicant, facility_type, location_description, status, food_items, vendor_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6)"
  )

"priv/repo/mobile_food_facility_permit.csv"
|> File.stream!(read_ahead: 100_000)
|> DataSFParser.parse_stream()
|> Stream.map(fn [
                   location_id,
                   applicant,
                   facility_type,
                   cnn,
                   location_description,
                   address,
                   blocklot,
                   block,
                   lot,
                   permit,
                   status,
                   food_items,
                   x,
                   y,
                   latitude,
                   longitude,
                   schedule,
                   days_hours,
                   noisent,
                   approved,
                   received,
                   prior_permit,
                   expiration_date,
                   location,
                   fire_prevention_districts,
                   police_districts,
                   supervisor_districts,
                   zipcodes,
                   neighborhoods
                 ] ->
  attrs = %{
    location_id: location_id,
    applicant: applicant,
    facility_type: facility_type,
    cnn: cnn,
    location_description: location_description,
    address: address,
    blocklot: blocklot,
    block: block,
    lot: lot,
    permit: permit,
    status: status,
    food_items: food_items,
    x: x,
    y: y,
    latitude: latitude,
    longitude: longitude,
    schedule: schedule,
    days_hours: days_hours,
    noisent: noisent,
    approved: approved,
    received: received,
    prior_permit: prior_permit,
    expiration_date: expiration_date,
    location: location,
    fire_prevention_districts: fire_prevention_districts,
    police_districts: police_districts,
    supervisor_districts: supervisor_districts,
    zipcodes: zipcodes,
    neighborhoods: neighborhoods
  }

  vendor =
    %PeckEa.PeckEA.Vendor{}
    |> PeckEa.PeckEA.Vendor.changeset(attrs)

  inserted_vendor = PeckEa.Repo.insert!(vendor)

  :ok =
    Exqlite.Sqlite3.bind(conn, statement, [
      applicant,
      facility_type,
      location_description,
      status,
      food_items,
      inserted_vendor.id
    ])

  :done = Exqlite.Sqlite3.step(conn, statement)
end)
|> Stream.run()
