/**
 * English Master Pro - Welcome App
 * Simple welcome screen for testing
 */

import React from 'react';
import {
  StyleSheet,
  Text,
  View,
  StatusBar,
  useColorScheme,
} from 'react-native';
import {
  SafeAreaProvider,
  SafeAreaView,
} from 'react-native-safe-area-context';

function App(): React.JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? '#1a1a1a' : '#f5f5f5',
  };

  const textStyle = {
    color: isDarkMode ? '#ffffff' : '#333333',
  };

  return (
    <SafeAreaProvider>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <SafeAreaView style={[styles.container, backgroundStyle]}>
        <View style={styles.content}>
          <Text style={[styles.title, textStyle]}>Welcome to</Text>
          <Text style={[styles.appName, textStyle]}>English Master Pro</Text>
          <View style={styles.divider} />
          <Text style={[styles.subtitle, textStyle]}>
            Your journey to mastering English starts here!
          </Text>
          <View style={styles.footer}>
            <Text style={[styles.version, textStyle]}>Version 1.0.0</Text>
          </View>
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: '300',
    marginBottom: 10,
    textAlign: 'center',
  },
  appName: {
    fontSize: 36,
    fontWeight: 'bold',
    marginBottom: 30,
    textAlign: 'center',
    letterSpacing: 1,
  },
  divider: {
    width: 60,
    height: 3,
    backgroundColor: '#007AFF',
    marginBottom: 30,
    borderRadius: 2,
  },
  subtitle: {
    fontSize: 16,
    textAlign: 'center',
    lineHeight: 24,
    paddingHorizontal: 20,
  },
  footer: {
    position: 'absolute',
    bottom: 40,
    alignItems: 'center',
  },
  version: {
    fontSize: 12,
    opacity: 0.6,
  },
});

export default App;
