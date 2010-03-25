require 'active_record'

module ColumnTimestamps
  def self.included(klass)
    klass.send :extend, ClassMethods
    klass.send :before_save, :update_column_timestamps
  end

  module ClassMethods
    def timestamped_column_names
      @timestamped_column_names ||= self.column_names.select { |c| self.column_names.include?("#{c}_updated_at") }
    end
  end

  private

  def update_column_timestamps
    current_time = self.class.default_timezone == :utc ? Time.now.utc : Time.now
    self.class.timestamped_column_names.each do |column_name|
      if self.send(:"#{column_name}_changed?") || (self.send(column_name).present? && new_record?)
        self.send(:"#{column_name}_updated_at=", current_time)
      end
    end
    true
  end
end