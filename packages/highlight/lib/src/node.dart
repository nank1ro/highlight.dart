class Node {
  Node({
    this.className,
    this.value,
    this.children,
    this.noPrefix = false,
    this.fillEmpty = false,
  });

  final String? className;
  final String? value;
  final List<Node>? children;
  final bool noPrefix;
  // Tells if the node is an empty space that has to be filled.
  final bool fillEmpty;

  @override
  String toString() {
    return 'Node(className: $className, value: $value, children: $children, noPrefix: $noPrefix)';
  }
}
