// main template for aws-cloudwatch-metrics
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.aws_cloudwatch_metrics;

local namespace = kube.Namespace(params.namespace);

{
  '00_namespace': namespace,
}
