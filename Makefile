PROJECT = rabbitmq_aws
PROJECT_DESCRIPTION = A minimalistic AWS API interface used by rabbitmq-autocluster (3.6.x) and other RabbitMQ plugins
PROJECT_MOD = rabbitmq_aws_app
PROJECT_REGISTERED = rabbitmq_aws

define PROJECT_ENV
[]
endef

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

LOCAL_DEPS = crypto inets ssl xmerl
BUILD_DEPS = rabbit_common
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk
TEST_DEPS = meck

current_rmq_ref = master

include rabbitmq-components.mk
include $(if $(ERLANG_MK_FILENAME),$(ERLANG_MK_FILENAME),erlang.mk)
