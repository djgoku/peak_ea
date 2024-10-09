defmodule PeckEaWeb.VendorLive.FormComponent do
  use PeckEaWeb, :live_component

  alias PeckEa.PeckEA

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage vendor records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="vendor-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:location_id]} type="text" label="Location" />
        <.input field={@form[:applicant]} type="text" label="Applicant" />
        <.input field={@form[:facility_type]} type="text" label="Facility type" />
        <.input field={@form[:cnn]} type="text" label="Cnn" />
        <.input field={@form[:location_description]} type="text" label="Location description" />
        <.input field={@form[:address]} type="text" label="Address" />
        <.input field={@form[:blocklot]} type="text" label="Blocklot" />
        <.input field={@form[:block]} type="text" label="Block" />
        <.input field={@form[:lot]} type="text" label="Lot" />
        <.input field={@form[:permit]} type="text" label="Permit" />
        <.input field={@form[:status]} type="text" label="Status" />
        <.input field={@form[:food_items]} type="text" label="Food items" />
        <.input field={@form[:x]} type="text" label="X" />
        <.input field={@form[:y]} type="text" label="Y" />
        <.input field={@form[:latitude]} type="text" label="Latitude" />
        <.input field={@form[:longitude]} type="text" label="Longitude" />
        <.input field={@form[:schedule]} type="text" label="Schedule" />
        <.input field={@form[:days_hours]} type="text" label="Days hours" />
        <.input field={@form[:noisent]} type="text" label="Noisent" />
        <.input field={@form[:approved]} type="text" label="Approved" />
        <.input field={@form[:received]} type="text" label="Received" />
        <.input field={@form[:prior_permit]} type="checkbox" label="Prior permit" />
        <.input field={@form[:expiration_date]} type="text" label="Expiration date" />
        <.input field={@form[:location]} type="text" label="Location" />
        <.input field={@form[:fire_prevention_districts]} type="text" label="Fire prevention districts" />
        <.input field={@form[:police_districts]} type="text" label="Police districts" />
        <.input field={@form[:supervisor_districts]} type="text" label="Supervisor districts" />
        <.input field={@form[:zipcodes]} type="text" label="Zipcodes" />
        <.input field={@form[:neighborhoods]} type="text" label="Neighborhoods" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Vendor</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{vendor: vendor} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(PeckEA.change_vendor(vendor))
     end)}
  end

  @impl true
  def handle_event("validate", %{"vendor" => vendor_params}, socket) do
    changeset = PeckEA.change_vendor(socket.assigns.vendor, vendor_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"vendor" => vendor_params}, socket) do
    save_vendor(socket, socket.assigns.action, vendor_params)
  end

  defp save_vendor(socket, :edit, vendor_params) do
    case PeckEA.update_vendor(socket.assigns.vendor, vendor_params) do
      {:ok, vendor} ->
        notify_parent({:saved, vendor})

        {:noreply,
         socket
         |> put_flash(:info, "Vendor updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_vendor(socket, :new, vendor_params) do
    case PeckEA.create_vendor(vendor_params) do
      {:ok, vendor} ->
        notify_parent({:saved, vendor})

        {:noreply,
         socket
         |> put_flash(:info, "Vendor created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
