"""This is a dummy app."""

from __future__ import annotations

import argparse


def main():
    """Run."""
    parser = argparse.ArgumentParser(description="This")
    subparsers = parser.add_subparsers(dest="action", required=True)
    subparsers.add_parser("reduce-tagger", help="tag files for size reduction")
    parser.parse_args()
