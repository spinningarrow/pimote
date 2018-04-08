#!/usr/bin/env bash

tt=0

while true; do
	echo $tt

	response=$(curl -s --get -d uuid=localsubtest -d tt=$tt https://ps.pndsn.com/v2/subscribe/SUBSCRIBE_KEY/pimote-deployments/0)
	echo $response

	channel=$(echo $response | jq '.m[0].c')
	message=$(echo $response | jq '.m[0].d')
	echo ${channel}
	echo ${message}
	test ${channel} != 'null' && echo ${message} >> ${channel}.out

	tt=$(echo $response | jq '.t.t')
	echo NEXT ITERATION
done
