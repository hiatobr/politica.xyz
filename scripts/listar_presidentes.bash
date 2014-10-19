#!/bin/bash
## /*
## 	Script para obter a lista de todos candidatos a presidente no site http://www.eleicoes2014.com.br
## 	Domínio público 2014 https://politica.xyz
## 	Código fonte em https://github.com/hiatobr/politica.xyz
## */

## Atalhos
SITE="http://www.eleicoes2014.com.br/"
PRE="${SITE}""candidatos-presidente/"

## Obter lista de urls para página de todos candidatos a presidentes

HTM=$(curl -sS "${PRE}" 2>&1)

PRESIDENTES=( )
for NOME in `echo "${HTM}" | grep -e 'class="candidate">' | awk '{ print $1 }' | sed -e 's/^href="\///' -e 's/"$//'`
do
	PRESIDENTES=( "${PRESIDENTES[@]}" "${SITE}${NOME}" )
done

for PRESIDENTE in ${PRESIDENTES[@]}
do
	echo "${PRESIDENTE}"
done

