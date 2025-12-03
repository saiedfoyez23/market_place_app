class MimeTypeUtils {

  static Map<String, String> mimeTypeMap = {
    // Text Types
    'txt': 'text/plain',
    'html': 'text/html',
    'htm': 'text/html',
    'css': 'text/css',
    'csv': 'text/csv',
    'js': 'application/javascript',
    'xml': 'application/xml',
    'json': 'application/json',

    // Image Types
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'bmp': 'image/bmp',
    'webp': 'image/webp',
    'svg': 'image/svg+xml',
    'ico': 'image/x-icon',
    'tiff': 'image/tiff',

    // Video Types
    'mp4': 'video/mp4',
    'webm': 'video/webm',
    'avi': 'video/x-msvideo',
    'mkv': 'video/x-matroska',
    'mov': 'video/quicktime',
    'flv': 'video/x-flv',
    'wmv': 'video/x-ms-wmv',

    // Audio Types
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'ogg': 'audio/ogg',
    'aac': 'audio/aac',
    'flac': 'audio/flac',
    'm4a': 'audio/mp4',

    // Document Types
    'pdf': 'application/pdf',
    'doc': 'application/msword',
    'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'xls': 'application/vnd.ms-excel',
    'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'ppt': 'application/vnd.ms-powerpoint',
    'pptx': 'application/vnd.openxmlformats-officedocument.presentationml.presentation',

    // CAD/Design Files
    'dwg': 'image/vnd.dwg',
    'dxf': 'application/dxf',
    'ifc': 'application/ifc',

    // Archive Types
    'zip': 'application/zip',
    'rar': 'application/x-rar-compressed',
    'tar': 'application/x-tar',
    'gz': 'application/gzip',
    '7z': 'application/x-7z-compressed',

    // OpenDocument Formats
    'odt': 'application/vnd.oasis.opendocument.text',
    'ods': 'application/vnd.oasis.opendocument.spreadsheet',
    'odp': 'application/vnd.oasis.opendocument.presentation',

    // Font Types
    'ttf': 'font/ttf',
    'otf': 'font/otf',
    'woff': 'font/woff',
    'woff2': 'font/woff2',

    // Executable/Binary Types
    'exe': 'application/octet-stream',
    'bin': 'application/octet-stream',
    'iso': 'application/x-iso9660-image',
    'dmg': 'application/x-apple-diskimage',
    'apk': 'application/vnd.android.package-archive',
    'deb': 'application/x-debian-package',
    'rpm': 'application/x-redhat-package-manager',
  };

  static String getMimeType(String filePath) {
    String extension = filePath.split('.').last.toLowerCase();
    return mimeTypeMap[extension] ?? 'application/octet-stream';
  }

}