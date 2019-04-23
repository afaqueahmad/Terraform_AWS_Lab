





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">
    
  <div id="readme" class="Box-body readme blob instapaper_body js-code-block-container">
    <article class="markdown-body entry-content p-5" itemprop="text"><p>In this mini lab/lesson we are going to provision an EC2 using Hashicorps's terraform..</p>
<p>Reference:
<a href="https://www.terraform.io/docs/providers/aws/index.html" rel="nofollow">https://www.terraform.io/docs/providers/aws/index.html</a></p>
<h2><a id="user-content-what-is-terraform" class="anchor" aria-hidden="true" href="#what-is-terraform"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>What is Terraform?</h2>
<p>Terraform is a tool made by Hashicorp for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers ( aws, azure, Google cloud) as well as custom in-house solutions.</p>
<p>You can compare <strong>Terraform</strong> to <strong>Cloudformation</strong>
. They are simililar but at the same time have differences.</p>
<h3><a id="user-content-steps-to-provision" class="anchor" aria-hidden="true" href="#steps-to-provision"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Steps to provision</h3>
<ol>
<li>Download the terraform binary file
<a href="https://www.terraform.io/downloads.html" rel="nofollow">https://www.terraform.io/downloads.html</a></li>
</ol>
<blockquote>
<p>If MAC users have <code>homebrew</code> installed on their machine:
Just do: <code>brew install terraform</code>
Go to step <code>5</code></p>
</blockquote>
<ol start="2">
<li>Extract the zip file</li>
<li>You will see the terraform binary executable  file</li>
<li>make sure that the terraform binary is available on the PATH.</li>
</ol>
<p>For Mac/Linux. On the shell/terminal,  go to the folder where terraform binary is extracted</p>
<div class="highlight highlight-text-shell-session"><pre><span class="pl-c1">echo $"export PATH=\$PATH:$(pwd)" &gt;&gt; ~/.bash_profile</span>
<span class="pl-c1">source ~/.bash_profile</span></pre></div>
<p>For Windows users : follow this to add Terraform to PATH <a href="https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows" rel="nofollow">https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows</a></p>
<ol start="5">
<li>make a  new directory(can be named anything) and go inside the directory</li>
</ol>
<div class="highlight highlight-text-shell-session"><pre><span class="pl-c1">mkdir terraform-july &amp;&amp; cd terraform-july</span></pre></div>
<ol start="6">
<li>Paste this following code to a file called ec2.tf( can be anything.tf)</li>
</ol>
<h4><a id="user-content-minimal-viable-configuration" class="anchor" aria-hidden="true" href="#minimal-viable-configuration"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>minimal viable configuration</h4>
<div class="highlight highlight-source-terraform"><pre><span class="pl-k">provider</span> <span class="pl-s">"</span><span class="pl-s">aws</span><span class="pl-s">"</span> {
  <span class="pl-smi">access_key</span> <span class="pl-k">=</span> <span class="pl-s">"</span><span class="pl-s">ACCESS_KEY_HERE</span><span class="pl-s">"</span>
  <span class="pl-smi">secret_key</span> <span class="pl-k">=</span> <span class="pl-s">"</span><span class="pl-s">SECRET_KEY_HERE</span><span class="pl-s">"</span>
  <span class="pl-smi">region</span>     <span class="pl-k">=</span> <span class="pl-s">"</span><span class="pl-s">us-east-1</span><span class="pl-s">"</span>
}

<span class="pl-k">resource</span> <span class="pl-s">"</span><span class="pl-s">aws_instance</span><span class="pl-s">"</span> <span class="pl-s">"</span><span class="pl-s">example</span><span class="pl-s">"</span> {
  <span class="pl-smi">ami</span>           <span class="pl-k">=</span> <span class="pl-s">"</span><span class="pl-s">ami-2757f631</span><span class="pl-s">"</span>
  <span class="pl-smi">instance_type</span> <span class="pl-k">=</span> <span class="pl-s">"</span><span class="pl-s">t2.micro</span><span class="pl-s">"</span>
}</pre></div>
<h4><a id="user-content-note" class="anchor" aria-hidden="true" href="#note"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Note:</h4>
<p>Replace the access_key and secret_access with your AWS IAM user credentials with enough permissions attached.
You can go to IAM console on AWS to do this.
First, go to the IAM management console
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ravsau/aws-labs/blob/master/images/iam-console.png"><img src="https://github.com/ravsau/aws-labs/raw/master/images/iam-console.png" alt="iam" style="max-width:100%;"></a></p>
<p>Then Click on the user's name and navigate to the security credentials tab. Click create access keys
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ravsau/aws-labs/blob/master/images/generate-access-keys.png"><img src="https://github.com/ravsau/aws-labs/raw/master/images/generate-access-keys.png" alt="iam" style="max-width:100%;"></a></p>
<p>Either download the csv file or, click show keys. Now you have both the access_key and secret_key required for the terraform code above.
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ravsau/aws-labs/blob/master/images/iam-generated-keys.png"><img src="https://github.com/ravsau/aws-labs/raw/master/images/iam-generated-keys.png" alt="iam" style="max-width:100%;"></a></p>
<p>If you've setup the AWS CLI and have credentials stored , you may skip the credential portion.
This is what Hashicorp says "If you simply leave out AWS credentials, Terraform will automatically search for saved API credentials (for example, in ~/.aws/credentials) or IAM instance profile credentials. This option is much cleaner for situations where tf files are checked into source control"</p>
<ol start="7">
<li>initialize the working directory for terraform</li>
</ol>
<div class="highlight highlight-text-shell-session"><pre><span class="pl-c1">terraform init</span></pre></div>
<p>"The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times."</p>
<ol start="8">
<li>Provision the ec2 with this command</li>
</ol>
<div class="highlight highlight-text-shell-session"><pre><span class="pl-c1">terraform apply</span></pre></div>
<ol start="9">
<li>
<p>Login to the AWS management console and navigate to the EC2 management console.  Check if an instance got provisioned</p>
</li>
<li>
<p>From your terminal/command prompt/ shell , destory the resources</p>
</li>
</ol>
<div class="highlight highlight-text-shell-session"><pre><span class="pl-c1">terraform destroy</span></pre></div>
<p>That's it! you installed Terraform and used it to proision an EC2 instance.</p>
</article>
  </div>

    </div>

  

  </body>
</html>

