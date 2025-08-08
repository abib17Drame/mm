import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../auxiliaires/locale_provider.dart';

/// Écran affichant les informations sur l'application.
class EcranInfoKhatma extends StatelessWidget {
  const EcranInfoKhatma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final localeProvider = context.watch<LocaleProvider>();
    final currentLanguage = localeProvider.locale.languageCode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.aboutKhatma ?? 'À propos de l\'application'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
                 child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.aboutAppTitle ?? 'À propos de cette application',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
                             textAlign: TextAlign.left,
             ),
             const SizedBox(height: 8),
             Text(
               localizations?.aboutAppDescription ?? '',
               style: Theme.of(context).textTheme.bodyLarge,
               textAlign: TextAlign.left,
             ),
             const SizedBox(height: 12),
             Text(
               localizations?.aboutAppObjectives ?? '',
               style: Theme.of(context).textTheme.titleLarge?.copyWith(
                 fontWeight: FontWeight.bold,
                 color: Theme.of(context).primaryColor,
               ),
               textAlign: TextAlign.left,
                         ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppQuranReading ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppDailyTracking ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppTemporalNavigation ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppCompleteList ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppCompletionDuaa ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppKhatmaDates ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppMultilingual ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppMultilingualDesc ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppLanguageChange ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppInterfaceAdapted ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppPersonalization ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppLightDarkMode ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppAdaptiveThemes ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppModernInterface ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppCompatibility ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppAndroid ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppIOS ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppWindows ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppMacOS ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppLinux ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppTechnicalFeatures ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppSQLite ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppOfflineMode ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppImageSharing ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppPDFExport ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppAutoBackup ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppPerformance ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppFastLoading ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppSmoothNavigation ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppMemoryOptimization ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppResponsiveInterface ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppDevelopment ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppFlutterFramework ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppModularArchitecture ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppMaintainableCode ?? ''),
                         _buildFeatureItem(context, localizations?.aboutAppTestsDocumentation ?? ''),
             const SizedBox(height: 12),
                        Text(
              localizations?.aboutAppSupport ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
             const SizedBox(height: 8),
             _buildFeatureItem(context, localizations?.aboutAppIntuitiveInterface ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppErrorHandling ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppHelpMessages ?? ''),
            _buildFeatureItem(context, localizations?.aboutAppRegularUpdates ?? ''),
          ],
        ),
      ),
    );
  }

     Widget _buildFeatureItem(BuildContext context, String text) {
     final localeProvider = context.watch<LocaleProvider>();
     final currentLanguage = localeProvider.locale.languageCode;
     
           return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        ),
      );
   }
}
