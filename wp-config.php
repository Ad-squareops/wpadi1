<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'adi' );

/** Database username */
define( 'DB_USER', 'admin' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'adi.cnbwakbdzeez.us-east-2.rds.amazonaws.com' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'FS_METHOD', 'direct' );
/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'r:}co{6<RVG/.S-VXlkEOH-/HWo!)pMW[,0CHx~g5!W;hwtG%<V6F<Cwuk>#dr*K');
define('SECURE_AUTH_KEY',  'M;_Wj+Lqac|o6iKc3[r+o`_X46`9DA`5^A0J9A%2-K.hPbU<#>;i3x|czzSs%Rmu');
define('LOGGED_IN_KEY',    'l-ftpe.J_j|Ek~d{ JPdb8[su-2L[tef:c8^/tI5qfGo@TM]Z<pS{AHw}Zts=TB7');
define('NONCE_KEY',        '`qhvK[zZ1Uqp[wOSS:u*M%,c1g+8l2rk||i@B7o]gAb3}?Ii]hUjTg_<(lw>$|M>');
define('AUTH_SALT',        'U_-o/TTb<@9j!}$ -<ptURg*ZSE/b=r2pl;pYPkU)K,TyYPX6NclM&TW^-|[#n+k');
define('SECURE_AUTH_SALT', 'bBt3<nL:66%i;@0d9WMeHO9XL8}rK_&0(3>T)KC9/%OYszcd/N:~sE1+ACE+Kp$1');
define('LOGGED_IN_SALT',   'O|<DB,|sJ+P&sUquH&-=nz1`4 8aAAtm4cKlFipNsLr?Joo4AcmOs1fp3EraB05<');
define('NONCE_SALT',       '}|BH^1w+x/Zk4tm^Esu{*Au9cb<-<-jvPZzmihZtBs}x4wJPyu[.~x&*MdggsD3V');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
