variable "public-traffic" {

    type = string
    default = "0.0.0.0/0"

}

variable "AZ" {
    type = list
    default = ["us-east-1a", "us-east-1b"]


}