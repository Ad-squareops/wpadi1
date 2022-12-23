Here we have automate the wordpress application using CI-CD pipleine .

For ci/cd we need 3 files :- wp-config.php , buildspec.yml , appspec.yml .

to create ami we have the code in packer directory. So there weave created the ami with all the dependencies required like all the related files of wordpress, cloudwatch agent and code deploy agent.

to create the infrastructure we have all the required codes in terraform directory.
