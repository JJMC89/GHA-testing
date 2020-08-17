"""This is a dummy app."""
import argparse


def main():
    """Run."""
    parser = argparse.ArgumentParser(description="This")
    subparsers = parser.add_subparsers(dest="action", required=True)
    subparsers.add_parser(
        "reduce-tagger",
        help="tag files for size reduction",
    )
