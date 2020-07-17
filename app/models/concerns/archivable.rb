module Archivable

  extend ActiveSupport::Concern

  class_methods do

    def active
      where(archived_on: nil)
    end

    def archived
      where.not(archived_on: nil)
    end

  end

  def active?
    archived_on.blank?
  end

  def archived?
    !active?
  end

  def archive!
    update!(archived_on: Date.current)
  end

  def unarchive!
    update(archived_on: nil)
  end
end
