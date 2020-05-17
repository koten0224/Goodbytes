class OrganizationsController < ApplicationController
  before_action :org_admin?, except: [:create]
  before_action :find_organization, except: [:create]

  def create
    organization = Organization.new(organization_params)
    if organization.save
      organization.update_role(current_user.id, 'admin')
      notice = '新增成功～'
    else
      notice = "新增失敗"
    end
    redirect_to root_path, notice: notice
  end

  def update
    @organization.update(organization_params)
    redirect_to root_path, notice: "更新成功"
  end

  def destroy
    @organization.destroy
    redirect_to root_path, notice: "刪除成功"
  end

  def find_organization
    @organization = Organization.find(params[:organization_id])
  end

  def organization_params
    params.require(:organization).permit(
      :name
    )
  end


end
