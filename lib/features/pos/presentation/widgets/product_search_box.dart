import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_quick_edit_sheet.dart';
import '../../providers/pos_session_provider.dart';

class ProductSearchBox extends ConsumerStatefulWidget {
  const ProductSearchBox({super.key});

  @override
  ConsumerState<ProductSearchBox> createState() => _ProductSearchBoxState();
}

class _ProductSearchBoxState extends ConsumerState<ProductSearchBox> {
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  
  List<Map<String, dynamic>> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchCtrl.text.toLowerCase().trim();
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults = [];
      });
      return;
    }

    // Mock search against the current DB provider
    final allProducts = ref.read(mockProductsProvider);
    final results = allProducts.where((p) {
      final name = (p['name'] as String).toLowerCase();
      return name.contains(query);
    }).toList();

    setState(() {
      _isSearching = true;
      _searchResults = results;
    });
  }

  void _openQuickEdit(Map<String, dynamic> product) {
    _focusNode.unfocus();
    _searchCtrl.clear();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductQuickEditSheet(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search Input
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: [
              if (_isSearching)
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: TextField(
            controller: _searchCtrl,
            focusNode: _focusNode,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search products by name...',
              hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF9CA3AF)),
              suffixIcon: _searchCtrl.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded, color: Color(0xFF9CA3AF), size: 20),
                      onPressed: () {
                        _searchCtrl.clear();
                        _focusNode.unfocus();
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.qr_code_scanner_rounded, color: Color(0xFF3B82F6), size: 20),
                      onPressed: () {}, // Future barcode scanner
                    ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),

        // Search Results Overlay (Rendered as inline list when searching)
        if (_isSearching && _searchCtrl.text.isNotEmpty)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            constraints: const BoxConstraints(maxHeight: 250),
            child: _searchResults.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        'No products found.',
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _searchResults.length,
                    separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    itemBuilder: (context, index) {
                      final p = _searchResults[index];
                      return ListTile(
                        onTap: () => _openQuickEdit(p),
                        title: Text(
                          p['name'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        subtitle: Text(
                          '₹${p['price']} / ${p['unit']} • ${p['category']}',
                          style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add_rounded, size: 18, color: Color(0xFF10B981)),
                        ),
                      );
                    },
                  ),
          ),
      ],
    );
  }
}
