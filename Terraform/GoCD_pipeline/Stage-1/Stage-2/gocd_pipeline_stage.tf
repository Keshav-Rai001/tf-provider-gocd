variable "baseurl" {
  description = "URL"
}

provider "gocd" 
{
  baseurl="${var.baseurl}"
  skip_ssl_check=true
}

provider "github" 
{
  token        = "af2e97f1cf2208929e480c3b3a28881d5c002c3e"
  #organization = "${var.github_organization}"
}
resource "gocd_pipeline_stage" "build" 
{
  name = "plan"
  pipeline = "plan"
  jobs =[<<JOB
 {
  "name": "plan",
  "tasks": 
  [
  {
    "type": "ant",
    "attributes": 
    {
      "run_if": ["passed"],
      "build_file": "https://af2e97f1cf2208929e480c3b3a28881d5c002c3e@github.com/Keshav-Rai001/terraform-with-gocd/blob/master/build.xml",
      "target": "https://af2e97f1cf2208929e480c3b3a28881d5c002c3e@github.com/Keshav-Rai001/terraform-with-gocd/blob/master/helloWorld.java"
      
    }
  }
  ]
 }
JOB
]
}

