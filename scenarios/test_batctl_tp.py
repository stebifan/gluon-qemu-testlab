#!/usr/bin/python36
import sys
sys.path.append(".")
from pynet import *
import asyncio
import time

a = Node()
b = Node()

connect(a, b)

start()                                        # This command boots the qemu instances

print("""
WARNING: THIS TEST IS CURRENTLY BROKEN, AS THE BATCTL TPMETER ALWAYS RETURNS TRUE.
""")

addr = a.succeed('cat /sys/class/net/primary0/address')
result = b.succeed(f'batctl tp {addr}')

print(result)

finish()
