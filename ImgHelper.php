<?php


namespace app\helpers;

use Yii;
use yii\helpers\Url;
use Imagine\Image\Point;
use yii\imagine\Image;
use Imagine\Image\Box;
use yii\helpers\BaseFileHelper;

class ImgHelper extends BaseFileHelper
{

    private static $cropName;
    private static $cropPath;
    private static $cropRelativPath = true;

    /**
     *
     * Проверяет наличия обрезанного файла картинки с переданными высотой и шириной,
     * если соответствующая картинка присутствует в web/crops, то возвращает к ней путь,
     * если нет то запускает ее создание.
     *
     * @author Maxim Shablinskiy
     * @date 30.09.2016
     * @param string $path путь к картинке
     * @param int $height Требуемая высота картинки
     * @param int $width Требуемая ширина картинки
     * @param string $alt Путь к альтернативной картинке
     * @return boolean
     */
    public static function cropImg($path, $width, $height, $alt = '')
    {
        ImgHelper::createDirectory(Yii::getAlias("@app/web/crops/"));
        self::$cropName = md5($width.$height.$path);
        self::$cropPath = Yii::getAlias("@app/web/crops/".self::$cropName);
        self::$cropRelativPath = Yii::getAlias("@web/crops/".self::$cropName);
        if(is_file(self::$cropPath)) {
            return self::$cropRelativPath;
        } else {

            if(Url::isRelative($path)) {
                if(is_file(Yii::getAlias('@app/web'.$path))) {
                    $path = Yii::getAlias('@app/web'.$path);
                }elseif($width == 1200) {
                    $path = Yii::getAlias('@app/web/images/default/defaultLong.jpg');
                }else{
                    $path = Yii::getAlias('@app/web/images/default/default.jpg');
                }
            }else {

                $urlHeaders = @get_headers($path);
                //return get_resource_type(fopen($path, 'r')).'|'. $urlHeaders[0] .'|'.$urlHeaders[1].'|'.$urlHeaders[2].'|'.$urlHeaders[3].'|'.$urlHeaders[4];
                if(!(strpos($urlHeaders[0], '304') or strpos($urlHeaders[0], '200'))) {
                    if($width == 1200){
                        $path = Yii::getAlias('@app/web/images/default/defaultLong.jpg');

                    }else{
                        $path = Yii::getAlias('@app/web/images/default/default.jpg');
                    }
                }
            }
            return self::changeProportion($path, $height, $width);

        }

    }


    /**
     *
     * Учитывая требования к размерам картинки и размеры самой картинки, производит обрезку сторон для достижения
     * пропорциональности с требуемым размером.
     *
     * @author Maxim Shablinskiy
     * @date 30.09.2016
     * @param string $path путь к исходной картинке
     * @param int $height Требуемая высота картинки
     * @param int $width Требуемая ширина картинки
     * @return boolean
     */
    private static function changeProportion($path, $height, $width) {


            $size = @getimagesize($path);
            $nativeWidth = $size[0];
            $nativeHeight = $size[1];
            if($nativeWidth <= 0 or $nativeHeight <= 0) {
                if($width == 1200){
                    $path = Yii::getAlias('@app/web/images/default/defaultLong.jpg');

                }else{
                    $path = Yii::getAlias('@app/web/images/default/default.jpg');
                }
                $size = @getimagesize($path);
                $nativeWidth = $size[0];
                $nativeHeight = $size[1];
            }
            $prHeight = $height/($width/$nativeWidth);
            $prWidth = $width/($height/$nativeHeight);

            if ($prHeight < $nativeHeight) {
                $prWidth = $nativeWidth;
                $pointX = 0;
                $pointY = abs($prHeight-$nativeHeight)/2;
            } elseif($prWidth < $nativeWidth) {
                $prHeight = $nativeHeight;
                $pointX = abs($prWidth-$nativeWidth)/2;
                $pointY = 0;
            } else {
                $pointX = 0;
                $pointY = 0;
            }
                $imgObj = Image::getImagine()->open($path);

                $imgObj->crop(new Point($pointX, $pointY), new Box($prWidth, $prHeight));
                if($nativeWidth > $width and $nativeHeight > $height) $imgObj->resize(new Box($width, $height));


            $imgObj->save(self::$cropPath);
            return self::$cropRelativPath;
    }





}
