function upgrade() {
    local canaryValuesFileLoc="$1"
    local primaryWt="$2"
    local secondaryWt="$3"

    local primaryWtPlaceholder="<WEIGHT_PRIMARY>"
    local secondaryWtPlaceholder="<WEIGHT_SECONDARY>"
    local exportTo="canary-inflated.yaml"

    local replacement=`cat "$canaryValuesFileLoc" | python3 -c "import sys;print(''.join(sys.stdin.readlines()).replace(sys.argv[1], sys.argv[3]).replace(sys.argv[2], sys.argv[4]))" $primaryWtPlaceholder $secondaryWtPlaceholder $primaryWt $secondaryWt`

    echo "$replacement">"$exportTo"

    echo "$exportTo"
}
function emptyCheck() {
    local varName="$1"
    local val="$2"
    if [[ "$val" == "" ]]
    then
        echo "Provided var $varName is empty"
        exit 1
    fi
}

primary="$1"
secondary="$2"

emptyCheck "\$1" "$primary" || exit 1
emptyCheck "\$1" "$secondary" || exit 1

inflatedFile=`upgrade "./canary-values.yaml" "$primary" "$secondary"`

helm upgrade --install --namespace default --values "$inflatedFile" --wait ing /Users/rgoyal/IdeaProjects/gvp-ssai/automation/ci-cd/containerized/k8s/helm/ssai-istio-ingress