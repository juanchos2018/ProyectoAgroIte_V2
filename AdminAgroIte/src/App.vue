<template>
  <router-view />
</template>

<script>
export default {
  name: 'App',
  created() {
    const currentPath = this.$router.history.current.path;

    if (window.localStorage.getItem('authenticated') === 'false') {
      this.$router.push('/login').catch(err => {
    // Ignore the vuex err regarding  navigating to the page they are already on.
            if (
              err.name !== 'NavigationDuplicated' &&
              !err.message.includes('Avoided redundant navigation to current location')
            ) {
              // But print any other errors to the console
              console(err);
            }
          });
    }

    if (currentPath === '/' || currentPath === '/app') {
      this.$router.push('/app/inicio');
    }
  },
};
</script>

<style src="./styles/theme.scss" lang="scss" />
