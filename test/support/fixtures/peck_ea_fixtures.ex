defmodule PeckEa.PeckEAFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PeckEa.PeckEA` context.
  """

  @doc """
  Generate a vendor.
  """
  def vendor_fixture(attrs \\ %{}) do
    {:ok, vendor} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        approved: "some approved",
        block: "some block",
        blocklot: "some blocklot",
        cnn: "some cnn",
        days_hours: "some days_hours",
        expiration_date: "some expiration_date",
        facility_type: "some facility_type",
        fire_prevention_districts: "some fire_prevention_districts",
        food_items: "some food_items",
        latitude: "some latitude",
        location: "some location",
        location_description: "some location_description",
        location_id: "some location_id",
        longitude: "some longitude",
        lot: "some lot",
        neighborhoods: "some neighborhoods",
        noisent: "some noisent",
        permit: "some permit",
        police_districts: "some police_districts",
        prior_permit: true,
        received: "some received",
        schedule: "some schedule",
        status: "some status",
        supervisor_districts: "some supervisor_districts",
        x: "some x",
        y: "some y",
        zipcodes: "some zipcodes"
      })
      |> PeckEa.PeckEA.create_vendor()

    vendor
  end
end
