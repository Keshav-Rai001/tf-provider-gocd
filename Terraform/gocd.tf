provider "kubernetes" 
{
 host = "https://192.168.99.100:8443"  

}

resource "kubernetes_service" "test_service" {
  metadata {
    name = "test"
  }

  spec {
    selector {
      app = "${kubernetes_pod.gocd.metadata.0.labels.app}"
    }

    port {
      port        = 8153
      target_port = 8153
    }

    type = "NodePort"
  }
}

resource "kubernetes_pod" "gocd" 
{
 metadata 
 {
   name = "gocd-example"    labels
   {
     app = "gocd"
   }
 }  
 spec
  {
   container
    {
     image = "gocd/gocd-server:v18.8.0"
     name  = "example"      
     port 
     {
       container_port = 80
     }
   }
 }
}
