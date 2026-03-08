provider "aws" {
	region = "us-east-1"
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Data source for the latest version of Windows Server 2025
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
data "aws_ssm_parameter" "latest_windows" {
	name = "/aws/service/ami-windows-latest/Windows_Server-2025-English-Full-Base"
}

resource "aws_instance" "helloworld" {
	ami =  data.aws_ssm_parameter.latest_windows.value
	instance_type = "t3.micro"
	tags = {
		Name = "Hello, World!"
	}
}