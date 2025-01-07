local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.aws_cloudwatch_metrics;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('aws-cloudwatch-metrics', params.namespace);

local appPath =
  local project = std.get(std.get(app, 'spec', {}), 'project', 'syn');
  if project == 'syn' then 'apps' else 'apps-%s' % project;

{
  ['%s/aws-cloudwatch-metrics' % appPath]: app,
}
