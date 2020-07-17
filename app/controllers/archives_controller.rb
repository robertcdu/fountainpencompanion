class ArchivesController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_record

  def create
    @record&.update(archived_on: Date.current)
    respond_to do |format|
      format.html { redirect_to route }
      format.json { render jsonapi: @record }
      format.jsonapi { render jsonapi: @record }
    end
  end

  def destroy
    @record&.update(archived_on: nil)
    respond_to do |format|
      format.html { redirect_to route }
      format.json { render jsonapi: @record }
      format.jsonapi { render jsonapi: @record }
    end
  end

  private

  def retrieve_record
    @record = collection.find_by(id: record_id)
  end

  def pen?
    params[:collected_pen_id].present?
  end

  def ink?
    params[:collected_ink_id].present?
  end

  def collection
    return current_user.collected_pens if pen?
    return current_user.collected_inks if ink?
    current_user.currently_inkeds
  end

  def record_id
    return params[:collected_pen_id] if pen?
    return params[:collected_ink_id] if ink?
    params[:currently_inked_id]
  end

  def route
    return collected_pens_path if pen?
    return collected_inks_path if ink?
    currently_inked_index_path
  end
end
