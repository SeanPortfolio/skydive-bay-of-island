<?php 

/**
* Class Helper
* 
* @author Talwinder Singh <talwindersingh8@gmail.com>
*/

class Helper
{

    /**
     * Get current datetime object.
     *
     * @return object
     */
    public static function getCurrentDateTime()
	{

		$objDateTime = new DateTime();

		return $objDateTime;

	}


	/**
     * Get current datetime string.
     *
     * @param string $format
     * @return string
     */
    public static function getCurrentDateTimeStr($format = 'Y-m-d H:i:s')
	{

		$objDateTime = self::getCurrentDateTime();

		return $objDateTime->format($format);
        
	}


	/**
     * Generate a URL friendly "slug" from a given string.
     *
     * @param  string  $str
     * @param  string  $separator
     * @param  string  $language
     * @return string
     */
    public static function slug($str, $separator = '-', $language = 'en')
    {

        // Convert all dashes/underscores into separator
        $flip = $separator == '-' ? '_' : '-';
        $str = preg_replace('!['.preg_quote($flip).']+!u', $separator, $str);

        // Replace @ with the word 'at'
        $str = str_replace('@', $separator.'at'.$separator, $str);

        // Remove all characters that are not the separator, letters, numbers, or whitespace.
        $str = preg_replace('![^'.preg_quote($separator).'\pL\pN\s]+!u', '', mb_strtolower($str));

        // Replace all separator characters and whitespace by a single separator
        $str = preg_replace('!['.preg_quote($separator).'\s]+!u', $separator, $str);
        return trim($str, $separator);

    }

    /**
     * Generate a clean full URL
     *
     * @param  string  $url
     * @param  string  $separator
     * @param  string  $language
     * @return string
     */
    public static function url($url, $separator = '-', $language = 'en')
    {

		$delimiter       = '/';
		
		$url             = trim($url, $delimiter);
		
		$segments        = explode($delimiter, $url);
		
		$cleanedSegments = array();

		foreach ($segments as $segment) {

			$segment = self::slug($segment, $separator, $language);

			if (!empty($segment)) {

				$cleanedSegments[] = $segment;

			}
		}
		
	 	return implode('/', $cleanedSegments);

    }

    /**
     * Check if file physically exists
     *
     * @param  string  $srcPath
     * @return boolean
     */
    public static function isFile($srcPath)
    {

       $srcPath = BASE_PATH.$srcPath;

       $srcPath = str_replace('/', DS, $srcPath);

       return is_file($srcPath);

    }
    

    /**
	 * Resize an image to give size
	 *
	 * @param string  $srcPath, Description - base path of image
	 * @param integer $width, Description - Width of new thumb
	 * @param integer $height, Description - Height of new thumb
	 *
	 * @return boolean
	*/

	public static function resizeImage($srcPath, $width, $height)
	{

		if (empty($srcPath)) return false;

		if (empty($width)) return false;

		if (empty($height)) return false;

		// Validate src dir
		if (strpos($srcPath, '/'.LIBRARY_DIR) === false) {
			
			$srcPath = '/'.LIBRARY_DIR.$srcPath;

		}

		$srcFullPath = BASE_PATH.str_replace('/', DS, $srcPath);

		if (!is_file($srcFullPath)) return false;

		$objResizer = new ImageResizer();
		
		
	}

    
	/**
	 * Create a thumbnail of the given image
	 *
	 * @param string  $srcPath, Description - base path of image
	 * @param integer $width, Description - Width of new thumb
	 * @param integer $height, Description - Height of new thumb
	 *
	 * @return mixed
	*/

	public static function createImageThumb($srcPath, $width, $height, $prevPath = null)
	{

		if (empty($srcPath)) return false;

		if (empty($width)) return false;

		if (empty($height)) return false;

		// Validate src dir
		if (strpos($srcPath, '/'.LIBRARY_DIR) === false) {
			
			$srcPath = '/'.LIBRARY_DIR.$srcPath;

		}

		if (!empty($prevPath)) {
			
			$prevPath = BASE_PATH.$prevPath;
			$prevPath = str_replace('/', DS, $prevPath);

			if (is_file($prevPath)) {
				
				unlink($prevPath);

			}
		}


		$srcFullPath = BASE_PATH.str_replace('/', DS, $srcPath);

		if (!is_file($srcFullPath)) return false;

		$arrPathInfo = pathinfo($srcFullPath);

		$baseName = $arrPathInfo['basename'];
		$fileName = $arrPathInfo['filename'].'-'.substr(create_rand_chars(), 0, 5);
		$fileExt  = $arrPathInfo['extension'];

		$objResizer = new ImageResizer();

		$objResizer->setSaveDirectory(UPLOADS_DIR_PATH);
		$objResizer->setSaveType($fileExt);
		$objResizer->setMaxWidth($width);
		$objResizer->setMaxHeight($height);
		$objResizer->path            = $srcFullPath;
		$objResizer->newImageNewName = $fileName;
		
        if (in_array($fileExt, array('jpg', 'jpeg'))) {

        	$objResizer->setQuality(80);

        }

        $objResizer->resizeToFillCropped();

        $newImagePath = '/'.UPLOADS_DIR.'/'.$fileName.'.'.$fileExt;

        return $newImagePath;

	}

	/**
	 * Redirect to the given URL with given code (optional)
	 *
	 * @param string $url, Description - location url
	 * @param integer $statusCode, Description - redirect code
	 *
	 * @return void
	*/
	public static function redirect($url, $statusCode = null)
	{

		$url = filter_var($url, FILTER_VALIDATE_URL);

		if(!empty($url)) { 

			if(!empty($statusCode)) {

				header('Location: '.$url, true, $statusCode);

			} else {

				header('Location: '.$url, false);

			}

			exit();

		}
	}

	/**
	 * Returns the specified text ($needle) wrapped in span
	 *
	 * @param string $needle, Description - string to wrap
	 * @param string $haystack, Description - string to search in
	 *
	 * @return string
	*/
	public static function getHighlightedText($needle, $haystack)
	{
		return str_replace($needle, '<span>'.$needle.'</span>', $haystack);
	}

	/**
	 * Returns the full page URL
	 *
	 * @return string
	*/
	public static function getFullUrl()
	{
		$delimiter = '/';
		$segments = func_get_args();

		$strSegments = ltrim(implode($delimiter, $segments), $delimiter);

		return BASE_URL . $delimiter . $strSegments;
	}



}

?>