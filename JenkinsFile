pipeline
{
   agent any
     environment 
                     {
        token_type = "Bearer "           
     }
                    
    stages 
{
stage('GetBearerToken') 
                    {
            steps 
                                         {
                                                             withCredentials([usernamePassword(credentialsId: 'OIC_USER', passwordVariable: 'clientsecret', usernameVariable: 'clientId')]) 
                                                             {
     sh '''
                     // Get token for OIC3
curl --location --request POST 'https://${IDCS_URL}/oauth2/v1/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'scope={{OIC3Scope}}' \
--data-urlencode "client_id=$clientId" \
--data-urlencode "client_secret=$clientsecret" --insecure -o token_OIC3.json
                '''
                                                             }       
                                         }
    } 
        stage('Export Integration') 
                                         {
            steps 
                                                             {
                sh '''
                
                                                                                 BEARER_TOKEN_OIC3=$( jq -r '.access_token' token_OIC3.json )
//Exporting from Gen3                                                                              
 curl --location --request GET -v -o "${INTEGRATION_ID}"'.iar' "https://{{OIC3URL}}/ic/api/integration/v1/integrations/${INTEGRATION_ID}%7C${VERSION}/archive" --header "Authorization: $token_type$BEARER_TOKEN_OIC3"
  '''
            }
        }
//Update GIT
//gitPassword is fine grained token mentioned in part of Prerequisite Step 4.
//Only for first time please execute gitclone command 
//git clone https://${gitUsername}:${gitPassword}@github.com/${gitUsername}/${REPO_NAME}.git               
stage('Update GIT') 
                                         {
            steps 
                                                             {
                                         withCredentials([usernamePassword(credentialsId: 'OICDeployment', passwordVariable: 'gitPassword', usernameVariable: 'gitUsername')]) 
                                                                                 {
    sh'''
        cd "${REPO_NAME}"
                       git pull
                       scp ../"${INTEGRATION_ID}"'.iar' "${INTEGRATION_ID}"'.iar'
                       git add .
                       git commit -m "$BUILD_NUMBER"
                       git push https://${gitUsername}:${gitPassword}@github.com/${gitUsername}/${REPO_NAME}.git     
                    '''
                                                                                 }
                                                             }                                       
    
                                         }
                    }
} 
