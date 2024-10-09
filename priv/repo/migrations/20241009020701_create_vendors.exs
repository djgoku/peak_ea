defmodule PeckEa.Repo.Migrations.CreateVendors do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :location_id, :string
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :string
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :x, :string
      add :y, :string
      add :latitude, :string
      add :longitude, :string
      add :schedule, :string
      add :days_hours, :string
      add :noisent, :string
      add :approved, :string
      add :received, :string
      add :prior_permit, :boolean, default: false, null: false
      add :expiration_date, :string
      add :location, :string
      add :fire_prevention_districts, :string
      add :police_districts, :string
      add :supervisor_districts, :string
      add :zipcodes, :string
      add :neighborhoods, :string

      timestamps(type: :utc_datetime)
    end
  end
end
