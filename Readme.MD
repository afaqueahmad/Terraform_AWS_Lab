





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">
    
  <div id="readme" class="Box-body readme blob instapaper_body js-code-block-container">
    <article class="markdown-body entry-content p-5" itemprop="text"><p>In this mini lab/lesson we are going to provision an EC2 using Hashicorps's terraform.</p>
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

  

  <details class="details-reset details-overlay details-overlay-dark">
    <summary data-hotkey="l" aria-label="Jump to line"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast linejump" aria-label="Jump to line">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-jump-to-line-form Box-body d-flex" action="" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
        <input class="form-control flex-auto mr-3 linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
        <button type="submit" class="btn" data-close-dialog>Go</button>
</form>    </details-dialog>
  </details>



  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </main>
  </div>
  

  </div>

        
<div class="footer container-lg width-full px-3" role="contentinfo">
  <div class="position-relative d-flex flex-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap ">
      <li class="mr-3">&copy; 2019 <span title="0.15339s from unicorn-7fd64c979c-pjmh8">GitHub</span>, Inc.</li>
        <li class="mr-3"><a data-ga-click="Footer, go to terms, text:terms" href="https://github.com/site/terms">Terms</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to privacy, text:privacy" href="https://github.com/site/privacy">Privacy</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to security, text:security" href="https://github.com/security">Security</a></li>
        <li class="mr-3"><a href="https://githubstatus.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a data-ga-click="Footer, go to help, text:help" href="https://help.github.com">Help</a></li>
    </ul>

    <a aria-label="Homepage" title="GitHub" class="footer-octicon mx-lg-4" href="https://github.com">
      <svg height="24" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="24" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
   <ul class="list-style-none d-flex flex-wrap ">
        <li class="mr-3"><a data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
        <li class="mr-3"><a href="https://github.com/pricing" data-ga-click="Footer, go to Pricing, text:Pricing">Pricing</a></li>
      <li class="mr-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
        <li class="mr-3"><a href="https://github.blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a data-ga-click="Footer, go to about, text:about" href="https://github.com/about">About</a></li>

    </ul>
  </div>
  <div class="d-flex flex-justify-center pb-6">
    <span class="f6 text-gray-light"></span>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
    You can’t perform that action at this time.
  </div>


    <script crossorigin="anonymous" integrity="sha512-5g98V2j8YTLsw7llCJHOsXoeKDJzBaS1EPqZe/YOBBiPXDE/+5S1WkRoX6AVs/hXTzyJGB3x95OKNDat4vpk0A==" type="application/javascript" src="https://github.githubassets.com/assets/compat-bootstrap-3ee7f90c.js"></script>
    <script crossorigin="anonymous" integrity="sha512-YpApTwpG5bZlXz9VWRHpdS4eus2IDzbWC9NQ7URGWAXHzBQzWW22DkzG4p//tHAEHt1XPj3UvEMz2Aep8cpQLw==" type="application/javascript" src="https://github.githubassets.com/assets/frameworks-9658b35e.js"></script>
    
    <script crossorigin="anonymous" async="async" integrity="sha512-dFbjVhUDfvH7EZo6tsy9OT1/taC5lkfI7Z61VicmpleBTjQlxWnCwNonEsl7miG6YYKme4JN2nag0GDxCrBiHg==" type="application/javascript" src="https://github.githubassets.com/assets/github-bootstrap-5167d3d0.js"></script>
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner" hidden
    >
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <template id="site-details-dialog">
  <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark" open>
    <summary aria-haspopup="dialog" aria-label="Close dialog"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast">
      <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
    </details-dialog>
  </details>
</template>

  <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
  <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
  </div>
</div>

  <div aria-live="polite" class="js-global-screen-reader-notice sr-only"></div>

  </body>
</html>

