class AddAttachmentDocumentToBugs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :bugs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :bugs, :document
  end
end
