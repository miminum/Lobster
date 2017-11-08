class ShopPhotoUploader < Shrine
    include ImageProcessing::MiniMagick
  
    plugin :activerecord
    plugin :determine_mime_type
    plugin :logging, logger: Rails.logger
    plugin :remove_attachment
    plugin :store_dimensions
    plugin :validation_helpers
    plugin :versions, names: [:original, :store, :thumb]
  
    Attacher.validate do
      validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
      validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    end
  
    def process(io, context)
      case context[:phase]
      when :store
        size_400 = resize_to_limit!(io.download, 400, 300)
        thumb = resize_to_limit(size_400, 200, 200)
        
        { original: io, medium: size_400, thumb: thumb }
      end
    end
  end