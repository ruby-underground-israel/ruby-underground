ActiveAdmin.register Job do
  controller do
    def update_resource(object, attributes)
      object.assign_attributes(*attributes, :as => :admin)
      run_update_callbacks object do
        save_resource(object)
      end
    end
  end
end
