class ImageUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # リサイズ,画像形式を変更にMiniMagickを使用する
  include CarrierWave::MiniMagick


   # 画像の上限を300pxにする
  process :resize_to_limit => [300, 300]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [75, 755]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 # ファイル名を<日付>.jogで保存する
  def filename
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

end
