# project-fundamentals
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

1)
TODO: Update the path with the name of your diagram:
      (Azure_Resource_Group.PNG)

2)These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

3) Enter the playbook file:
   Filebeat-playbook.yml
   Metricbeat-playbook.yml
   pentest.yml
   install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

1)Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

2)What aspect of security do load balancers protect? The load balancer protects applications from emerging threats, protects against DDoS attacks, authenticates user access, and simplifies PCI compliance.  
  What is the advantage of a jump box? The jump box is a secure gateway and allows the user to access devices in a separate security zone through the use of a ssh key. Access will only be allowed if the user has this key.  

3)Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
What does Filebeat watch for? Filebeat monitors the specific log files and locations, while collecting the log events and sends them to ELasticsearch or Logstash for indexing.
What does Metricbeat record? Metricbeat monitors the performance of the different servers in the environment. This information is then stored in Elasticsearch.

The configuration details of each machine may be found below.
4)Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_. 
(Machine_Configuration_Table.PNG)




### Access Policies

The machines on the internal network are not exposed to the public Internet. 

1)Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
  
My IP address: 98.206.232.151

2)Machines within the network can only be accessed by Jumpbox.
  Which machine did you allow to access your ELK VM? What was its IP         address? I allowed machine 98.206.232.151 to access the ELK VM through Port 5601. The ELK machine's private IP address is 10.1.0.4.

3)A summary of the access policies in place can be found in the table below.
(Access_Polices_Table.PNG)



### Elk Configuration

1)Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible? Ansible is a free, open-source tool that is easy to set up. It is powerful, flexible and efficient. It allows you to have a highly complex IT workflow.  

2)The playbook implements the following tasks:
Install docker, io
Install pip3
Install Docker Python Module
Increase virtual memory
Download and launch docker
 

3)The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


(docker_ps_output.png)


### Target Machines & Beats
1)This ELK server is configured to monitor the following machines:
 List the IP addresses of the machines you are monitoring. Three Web-VM’s are being monitored: 10.0.0.5, 10.0.0.6, 10.0.0.7

2)We have installed the following Beats on these machines:
Specify which Beats you successfully installed. I have successfully installed Filebeat and Metricbeat to monitor the three Web-VM’s.

3)These Beats allow us to collect the following information from each machine:
In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Metricbeat allows the Elk server to monitor CPU and memory usage. It monitors information that comes in and out of the servers at specified time intervals. It collects metrics and statistics and then sends them to the output the user specifies, like Elasticsearch or Logstash. Filebeat logs files, and forwards their data to Logstash or Elasticsearch for indexing. Some examples of supported output options in Filebeat are cloud, Redis, Kafka but Logstash and Elasticsearch are the most commonly used. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

1)SSH into the control node and follow the steps below:
- Copy the elk_install.yml file to ansible control. 
  (install_elk_yml.PNG)
- Update the hosts file to include webserver and ELK.

(hosts_file.PNG)


- Run the playbook, and navigate to Kibana to check that the installation 
worked as expected.http://20.85.247.221:5601/app/Kibana#/home
(Kibana_access.PNG)(Kibana_access.PNG)






2)Answer the following questions to fill in the blanks:
Which file is the playbook? The playbook files are .yml files that can be run with ansible. /etc/ansible/roles/filebeat-playbook.yml
Where do you copy it? You copy the file into a container where ansible is installed to be deployed.
Which file do you update to make Ansible run the playbook on a specific machine? You would update the hosts file.
How do I specify which machine to install the ELK server on versus which to install Filebeat on? In the hosts file you can specify where you want resources to be installed under the specific machines grouping category.
Which URL do you navigate to in order to check that the ELK server is running? Navigate to http://20.58.247.221:5601/app/kibana

1)As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
Download the ansible.cfg file (Ansible_configuration_file.PNG)
Add the remote_user to the ansible.cfg file
Add the VM that you want to use to run your ELK stack in the hosts file
 /etc/ansible/hosts , specify python with ansible_python_interpreter=/usr/bin/python3.
(hosts_file.PNG)
Create a new playbook: touch /etc/ansible/install-elk.yml (install_elk_yml.PNG)
Run the following commands to confirm the container is running and the playbook has updated properly:
1)sudo docker start <container name>
2)sudo docker ps
3)sudo docker exec -ti <container name> bash
4)sudo ansible-playbook <file_name.yml> 


