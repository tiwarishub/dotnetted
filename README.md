# dotnetted

<p> This repo contains various sample projects built for .NET Core. </br>
To deploy these to azure (web apps for now), <code>deployer.bat</code>  is added. (Works on windows machine only) </p>

## How to deploy to your existing azure web app?

### Setting deployer.bat for your scenario
Open the <code>deployer.bat</code> in an editor of your choice, set the values of following variables as per your requirement -</br>
- If you want to conncet to Az using SPN,
  - spn_id=<code>SPN Client ID</code>
  - spn_secret=<code>SPN Client Secret</code>
  - tenant_id=<code>Tenant ID</code>
- If you want to connect to Az with your account, replace <code>az login --service-principal -u %spn_id% -p %spn_secret% --tenant %tenant_id%</code> with <code>az login</code>
- In either case, resource_group=<code>Resource group name</code>

### Deploying to Azure with deployer.bat

Go to root folder (dotnetted), open command prompt and run - </br>
<code> deployer project-folder-name webappname </code>

