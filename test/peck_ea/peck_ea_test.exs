defmodule PeckEa.PeckEATest do
  use PeckEa.DataCase

  alias PeckEa.PeckEA

  describe "vendors" do
    alias PeckEa.PeckEA.Vendor

    import PeckEa.PeckEAFixtures

    @invalid_attrs %{
      block: nil,
      status: nil,
      address: nil,
      permit: nil,
      location: nil,
      approved: nil,
      y: nil,
      x: nil,
      location_id: nil,
      applicant: nil,
      facility_type: nil,
      cnn: nil,
      location_description: nil,
      blocklot: nil,
      lot: nil,
      food_items: nil,
      latitude: nil,
      longitude: nil,
      schedule: nil,
      days_hours: nil,
      noisent: nil,
      received: nil,
      prior_permit: nil,
      expiration_date: nil,
      fire_prevention_districts: nil,
      police_districts: nil,
      supervisor_districts: nil,
      zipcodes: nil,
      neighborhoods: nil
    }

    test "list_vendors/0 returns all vendors" do
      vendor = vendor_fixture()
      assert PeckEA.list_vendors() == [vendor]
    end

    test "get_vendor!/1 returns the vendor with given id" do
      vendor = vendor_fixture()
      assert PeckEA.get_vendor!(vendor.id) == vendor
    end

    test "create_vendor/1 with valid data creates a vendor" do
      valid_attrs = %{
        block: "some block",
        status: "some status",
        address: "some address",
        permit: "some permit",
        location: "some location",
        approved: "some approved",
        y: "some y",
        x: "some x",
        location_id: "some location_id",
        applicant: "some applicant",
        facility_type: "some facility_type",
        cnn: "some cnn",
        location_description: "some location_description",
        blocklot: "some blocklot",
        lot: "some lot",
        food_items: "some food_items",
        latitude: "some latitude",
        longitude: "some longitude",
        schedule: "some schedule",
        days_hours: "some days_hours",
        noisent: "some noisent",
        received: "some received",
        prior_permit: true,
        expiration_date: "some expiration_date",
        fire_prevention_districts: "some fire_prevention_districts",
        police_districts: "some police_districts",
        supervisor_districts: "some supervisor_districts",
        zipcodes: "some zipcodes",
        neighborhoods: "some neighborhoods"
      }

      assert {:ok, %Vendor{} = vendor} = PeckEA.create_vendor(valid_attrs)
      assert vendor.block == "some block"
      assert vendor.status == "some status"
      assert vendor.address == "some address"
      assert vendor.permit == "some permit"
      assert vendor.location == "some location"
      assert vendor.approved == "some approved"
      assert vendor.y == "some y"
      assert vendor.x == "some x"
      assert vendor.location_id == "some location_id"
      assert vendor.applicant == "some applicant"
      assert vendor.facility_type == "some facility_type"
      assert vendor.cnn == "some cnn"
      assert vendor.location_description == "some location_description"
      assert vendor.blocklot == "some blocklot"
      assert vendor.lot == "some lot"
      assert vendor.food_items == "some food_items"
      assert vendor.latitude == "some latitude"
      assert vendor.longitude == "some longitude"
      assert vendor.schedule == "some schedule"
      assert vendor.days_hours == "some days_hours"
      assert vendor.noisent == "some noisent"
      assert vendor.received == "some received"
      assert vendor.prior_permit == true
      assert vendor.expiration_date == "some expiration_date"
      assert vendor.fire_prevention_districts == "some fire_prevention_districts"
      assert vendor.police_districts == "some police_districts"
      assert vendor.supervisor_districts == "some supervisor_districts"
      assert vendor.zipcodes == "some zipcodes"
      assert vendor.neighborhoods == "some neighborhoods"
    end

    test "create_vendor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PeckEA.create_vendor(@invalid_attrs)
    end

    test "update_vendor/2 with valid data updates the vendor" do
      vendor = vendor_fixture()

      update_attrs = %{
        block: "some updated block",
        status: "some updated status",
        address: "some updated address",
        permit: "some updated permit",
        location: "some updated location",
        approved: "some updated approved",
        y: "some updated y",
        x: "some updated x",
        location_id: "some updated location_id",
        applicant: "some updated applicant",
        facility_type: "some updated facility_type",
        cnn: "some updated cnn",
        location_description: "some updated location_description",
        blocklot: "some updated blocklot",
        lot: "some updated lot",
        food_items: "some updated food_items",
        latitude: "some updated latitude",
        longitude: "some updated longitude",
        schedule: "some updated schedule",
        days_hours: "some updated days_hours",
        noisent: "some updated noisent",
        received: "some updated received",
        prior_permit: false,
        expiration_date: "some updated expiration_date",
        fire_prevention_districts: "some updated fire_prevention_districts",
        police_districts: "some updated police_districts",
        supervisor_districts: "some updated supervisor_districts",
        zipcodes: "some updated zipcodes",
        neighborhoods: "some updated neighborhoods"
      }

      assert {:ok, %Vendor{} = vendor} = PeckEA.update_vendor(vendor, update_attrs)
      assert vendor.block == "some updated block"
      assert vendor.status == "some updated status"
      assert vendor.address == "some updated address"
      assert vendor.permit == "some updated permit"
      assert vendor.location == "some updated location"
      assert vendor.approved == "some updated approved"
      assert vendor.y == "some updated y"
      assert vendor.x == "some updated x"
      assert vendor.location_id == "some updated location_id"
      assert vendor.applicant == "some updated applicant"
      assert vendor.facility_type == "some updated facility_type"
      assert vendor.cnn == "some updated cnn"
      assert vendor.location_description == "some updated location_description"
      assert vendor.blocklot == "some updated blocklot"
      assert vendor.lot == "some updated lot"
      assert vendor.food_items == "some updated food_items"
      assert vendor.latitude == "some updated latitude"
      assert vendor.longitude == "some updated longitude"
      assert vendor.schedule == "some updated schedule"
      assert vendor.days_hours == "some updated days_hours"
      assert vendor.noisent == "some updated noisent"
      assert vendor.received == "some updated received"
      assert vendor.prior_permit == false
      assert vendor.expiration_date == "some updated expiration_date"
      assert vendor.fire_prevention_districts == "some updated fire_prevention_districts"
      assert vendor.police_districts == "some updated police_districts"
      assert vendor.supervisor_districts == "some updated supervisor_districts"
      assert vendor.zipcodes == "some updated zipcodes"
      assert vendor.neighborhoods == "some updated neighborhoods"
    end

    test "update_vendor/2 with invalid data returns error changeset" do
      vendor = vendor_fixture()
      assert {:error, %Ecto.Changeset{}} = PeckEA.update_vendor(vendor, @invalid_attrs)
      assert vendor == PeckEA.get_vendor!(vendor.id)
    end

    test "delete_vendor/1 deletes the vendor" do
      vendor = vendor_fixture()
      assert {:ok, %Vendor{}} = PeckEA.delete_vendor(vendor)
      assert_raise Ecto.NoResultsError, fn -> PeckEA.get_vendor!(vendor.id) end
    end

    test "change_vendor/1 returns a vendor changeset" do
      vendor = vendor_fixture()
      assert %Ecto.Changeset{} = PeckEA.change_vendor(vendor)
    end
  end
end
