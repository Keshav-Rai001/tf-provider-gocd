variable "baseurl" 
{
  description = "URL"
}

provider "gocd"
{
	baseurl="${var.baseurl}"
	#host = "https://192.168.99.100:8443" 
}
resource "gocd_pipeline_template" "terraform-builder" {
  name = "build"
}