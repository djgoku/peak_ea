defmodule PeckEa.PeckEA.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendors" do
    field :block, :string
    field :status, :string
    field :address, :string
    field :permit, :string
    field :location, :string
    field :approved, :string, default: ""
    field :y, :string
    field :x, :string
    field :location_id, :string
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :string
    field :location_description, :string
    field :blocklot, :string
    field :lot, :string
    field :food_items, :string, default: ""
    field :latitude, :string
    field :longitude, :string
    field :schedule, :string
    field :days_hours, :string, default: ""
    field :noisent, :string, default: ""
    field :received, :string
    field :prior_permit, :boolean, default: false
    field :expiration_date, :string
    field :fire_prevention_districts, :string
    field :police_districts, :string
    field :supervisor_districts, :string
    field :zipcodes, :string
    field :neighborhoods, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noisent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date,
      :location,
      :fire_prevention_districts,
      :police_districts,
      :supervisor_districts,
      :zipcodes,
      :neighborhoods
    ])

    # TODO: add validation back when we need to validate incoming data
    # |> validate_required([
    #   :location_id,
    #   :applicant,
    #   :facility_type,
    #   :cnn,
    #   :location_description,
    #   :address,
    #   :blocklot,
    #   :block,
    #   :lot,
    #   :permit,
    #   :status,
    #   :food_items,
    #   :x,
    #   :y,
    #   :latitude,
    #   :longitude,
    #   :schedule,
    #   :days_hours,
    #   :noisent,
    #   :approved,
    #   :received,
    #   :prior_permit,
    #   :expiration_date,
    #   :location,
    #   :fire_prevention_districts,
    #   :police_districts,
    #   :supervisor_districts,
    #   :zipcodes,
    #   :neighborhoods
    # ])
  end
end
