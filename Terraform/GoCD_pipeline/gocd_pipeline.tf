variable "baseurl" {
  description = "URL"
}

provider "gocd" {
  baseurl = "${var.baseurl}"
}

resource "gocd_pipeline" "build" {
  name           = "build"
  group          = "terraform-provider-gocd"
  label_template = "0.0.$${COUNT}"

  materials = [
    {
      type = "git"

      attributes {
        name = "terraform-with-gocd"
        url  = "https://github.com/Keshav-Rai001/terraform-with-gocd"
      }
    },
  ]
}
