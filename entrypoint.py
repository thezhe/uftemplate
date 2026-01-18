#!/usr/bin/env python

import sys

import msgpack
from pydantic_settings import CliApp

from build.schemas.args import Args
from build.schemas.msg import Msg

# CLI
args = CliApp.run(Args)

# Reused objects
packer = msgpack.Packer()
unpacker = msgpack.Unpacker(sys.stdin.buffer)

# Process
for obj in unpacker:
    Msg.model_validate(obj)
    sys.stdout.buffer.write(Msg(**obj).model_dump(mode="json"))
