local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.aws_cloudwatch_metrics;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('aws-cloudwatch-metrics', params.namespace);

{
  'aws-cloudwatch-metrics': app,
}
