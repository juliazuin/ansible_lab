cd projetos/ansible_lab/exercicios
~/terraform/terraform init
~/terraform/terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 40 # 40 segundos

echo $"[ec2-jenkins]" > ../1-ansible/hosts # cria arquivo
echo "$(~/terraform/terraform output | grep public_dns | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../1-ansible/hosts # captura output faz split de espaco e replace de ",

echo "Aguardando criação de maquinas ..."
sleep 40 # 40 segundos

cd ../1-ansible
ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/Desktop/devops/treinamentoItau
$3;exit}' |  sed -e 's/\"//g'

