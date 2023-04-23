## ESPECIFICACIÓN DE LAS REGLAS DEL FIREWALL DE LOS SERVIDORES

Es importante mencionar la definición de cada una de las reglas de los firewalls para cada uno de los servidores del proyecto. Es por esto que a continuación se especifican cada una de estas para cada uno de los servidores con los que cuenta nuestra infraestructura.

&nbsp;

#### 1.  Servidor manager de base de datos


|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       UDP     |     Allow    |     Any    |
|   27017   |       TCP      |     Allow    |     Any    |
|   Any   |       ICMP      |     Allow    |     Any    |
|   8080  |       TCP     |     Allow    |     Any    |
|   Any  |       Any     |     Allow    |     VirtualNetwork    |
|   Any  |       Any     |     Allow    |     AzureLoadBalancer    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 2.  Servidor worker de base de datos

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       TCP      |     Allow    |     Any    |
|   2377,7946,4789   |       UDP     |     Allow    |     Any    |
|   27018   |       TCP      |     Allow    |     Any    |
|   Any   |       ICMP      |     Allow    |     Any    |
|   Any  |       Any     |     Allow    |     VirtualNetwork    |
|   Any  |       Any     |     Allow    |     AzureLoadBalancer    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 3.  Servidor manager de la aplicación

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     Any    |
|    1802   |       TCP      |     Allow    |     Any    |
|   Any  |       Any     |     Deny    |     Any    |

&nbsp;

#### 4.  Servidor worker de la aplicación

|    To    |    Protocol    |    Action    |    From    |
|   :--:   |      :--:      |     :--:     |    :--:    |
|    22    |       TCP      |     Allow    |     Any    |
|    1802   |       TCP      |     Allow    |     Any    |
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