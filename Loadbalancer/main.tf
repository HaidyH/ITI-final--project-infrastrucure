/* data "ncloud_server_images" "images" {
  filter {
    name = "product_name"
    values = ["CentOS 7.3 (64-bit)"]
  }

  output_file = "image.json" 
}

output "list_image" {
  value = {
    for image in data.ncloud_server_images.images.server_images:
    image.id => image.product_name
  }
} */