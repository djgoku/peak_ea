defmodule PeckEaWeb.VendorLiveTest do
  use PeckEaWeb.ConnCase

  import Phoenix.LiveViewTest
  import PeckEa.PeckEAFixtures

  @create_attrs %{
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
  @update_attrs %{
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

  # TODO: add validation back when we need to validate incoming data
  # @invalid_attrs %{
  #   block: nil,
  #   status: nil,
  #   address: nil,
  #   permit: nil,
  #   location: nil,
  #   approved: nil,
  #   y: nil,
  #   x: nil,
  #   location_id: nil,
  #   applicant: nil,
  #   facility_type: nil,
  #   cnn: nil,
  #   location_description: nil,
  #   blocklot: nil,
  #   lot: nil,
  #   food_items: nil,
  #   latitude: nil,
  #   longitude: nil,
  #   schedule: nil,
  #   days_hours: nil,
  #   noisent: nil,
  #   received: nil,
  #   prior_permit: false,
  #   expiration_date: nil,
  #   fire_prevention_districts: nil,
  #   police_districts: nil,
  #   supervisor_districts: nil,
  #   zipcodes: nil,
  #   neighborhoods: nil
  # }

  defp create_vendor(_) do
    vendor = vendor_fixture()
    %{vendor: vendor}
  end

  describe "Index" do
    setup [:create_vendor]

    test "lists all vendors", %{conn: conn, vendor: vendor} do
      {:ok, _index_live, html} = live(conn, ~p"/vendors")

      assert html =~ "Listing Vendors"
      assert html =~ vendor.block
    end

    test "saves new vendor", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("a", "New Vendor") |> render_click() =~
               "New Vendor"

      assert_patch(index_live, ~p"/vendors/new")

      # TODO: add validation back when we need to validate incoming data
      # assert index_live
      #        |> form("#vendor-form", vendor: @invalid_attrs)
      #        |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vendor-form", vendor: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/vendors")

      html = render(index_live)
      assert html =~ "Vendor created successfully"
      assert html =~ "some block"
    end

    test "updates vendor in listing", %{conn: conn, vendor: vendor} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("#vendors-#{vendor.id} a", "Edit") |> render_click() =~
               "Edit Vendor"

      assert_patch(index_live, ~p"/vendors/#{vendor}/edit")

      # TODO: add validation back when we need to validate incoming data
      # assert index_live
      #        |> form("#vendor-form", vendor: @invalid_attrs)
      #        |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vendor-form", vendor: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/vendors")

      html = render(index_live)
      assert html =~ "Vendor updated successfully"
      assert html =~ "some updated block"
    end

    test "deletes vendor in listing", %{conn: conn, vendor: vendor} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("#vendors-#{vendor.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#vendors-#{vendor.id}")
    end
  end

  describe "Show" do
    setup [:create_vendor]

    test "displays vendor", %{conn: conn, vendor: vendor} do
      {:ok, _show_live, html} = live(conn, ~p"/vendors/#{vendor}")

      assert html =~ "Show Vendor"
      assert html =~ vendor.block
    end

    test "updates vendor within modal", %{conn: conn, vendor: vendor} do
      {:ok, show_live, _html} = live(conn, ~p"/vendors/#{vendor}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Vendor"

      assert_patch(show_live, ~p"/vendors/#{vendor}/show/edit")

      # TODO: add validation back when we need to validate incoming data
      # assert show_live
      #        |> form("#vendor-form", vendor: @invalid_attrs)
      #        |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#vendor-form", vendor: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/vendors/#{vendor}")

      html = render(show_live)
      assert html =~ "Vendor updated successfully"
      assert html =~ "some updated block"
    end
  end
end
