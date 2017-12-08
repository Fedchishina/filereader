<?php
include_once ROOT. '/app/Models/FileReader.php';

class FileController
{
    public function actionIndex()
    {
        require_once ROOT . '/resources/views/index.php';
        return true;
    }

    public function actionRead()
    {
        if ( isset ($_FILES['file'])) {
            $file = new FileReader($_FILES['file']['tmp_name']);
            echo "Элемент FileReader создан";
        } else {
            echo "Нет файла. Элемент FileReader не создан";
        }

        return true;
    }
}