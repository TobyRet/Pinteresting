class Pin < ActiveRecord::Base
	
	validates :description, presence: true
	validates :user_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment :image, presence: true,
															 content_type: { content_type: ['image/jpeg', 'image/jpg']},
															 size: {less_than: 5.megabytes}
	belongs_to :user
	
	def pin_params
	   params.require(:pin).permit(:description, :image)
	end
end

