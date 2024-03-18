import 'package:bbd_frontend/services/dashboard_service.dart';
import 'package:flutter/material.dart';

class DashboardController {
  DashboardService dashboardService = DashboardService();
  bool isLoading = false;
  getCategoryList({required BuildContext context, required setState}) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> query = {"pageNumber": 0, "pageSize": 6};
    try {
      await dashboardService.getCategoryList(
          query: query, context: context, setState: setState);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print({'error': e});
    }
  }
}
