## ESPECIFICACIÓN DE LAS REGLAS DEL FIREWALL DE LOS SERVIDORES

Es importante mencionar cada una de las reglas de los firewalls que se implementaron para cada uno de los servidores de este proyecto. Es por esto que a continuación se listan cada uno de los servidores junto con sus respectivas reglas del firewall, así:

&nbsp;

#### 1.  Servidor manager de base de datos


|    To    |    Protocol    |    Action    |    From   |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     InfraestuctureManager, BackupServer    |
|   80  |       TCP     |     Allow    |     Any    |
|   2377,7946,4789   |       TCP      |     Allow    |     WorkerNode    |
|   2377,7946,4789   |       UDP     |     Allow    |     WorkerNode    |
|   27017   |       TCP      |     Allow    |     WorkerNode, BackendServers, Developers    |
|   Any   |       ICMP      |     Allow    |     WorkerNode, BackendServers, Developers    |
|   Any  |       Any     |     Allow    |     VirtualNetwork    |
|   Any  |       Any     |     Allow    |     AzureLoadBalancer    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 2.  Servidor worker de base de datos

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     InfraestuctureManager   |
|   2377,7946,4789   |       TCP      |     Allow    |     ManagerNode    |
|   2377,7946,4789   |       UDP     |     Allow    |     ManagerNode    |
|   27018   |       TCP      |     Allow    |     ManagerNode, BackendServers, Developers    |
|   Any   |       ICMP      |     Allow    |     ManagerNode, BackendServers, Developers    |
|   Any  |       Any     |     Allow    |     VirtualNetwork    |
|   Any  |       Any     |     Allow    |     AzureLoadBalancer    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 3.  Servidor manager de la aplicación

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     InfraestuctureManager    |
|   80  |       TCP     |     Allow    |     Any    |
|    1802   |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       TCP      |     Allow    |     WorkerNode    |
|   2377,7946,4789   |       UDP     |     Allow    |     WorkerNode    |
|   Any   |       ICMP      |     Allow    |     Any    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 4.  Servidor worker de la aplicación

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     InfraestuctureManager    |
|    1802   |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       TCP      |     Allow    |     ManagerNode    |
|   2377,7946,4789   |       UDP     |     Allow    |     ManagerNode    |
|   Any   |       ICMP      |     Allow    |     Any    |
|   Any  |       Any     |     Deny    |     Any    |


&nbsp;

#### 5.  Servidor de backup

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     Any    |
|   Any   |       ICMP      |     Allow    |     Any    |
|   Any  |       Any     |     Allow    |     VirtualNetwork    |
|   Any  |       Any     |     Allow    |     AzureLoadBalancer    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;