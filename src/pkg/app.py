"""This is a dummy app."""
import argparse


def main():
    """Dummy."""
    parser = argparse.ArgumentParser(description="This")
    subparsers = parser.add_subparsers(dest="action", required=True)
    subparsers.add_parser(
        "reduce-tagger",
        parents=[always_parser, summary_parser],
        help="tag files for size reduction",
    )
