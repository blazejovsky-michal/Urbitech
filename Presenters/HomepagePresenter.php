<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use App\Model\DataEarning;
use Nette\Application\UI\Form;

final class HomepagePresenter extends \Nette\Application\UI\Presenter
{
    private DataEarning $earnedData;
    private Nette\Database\Explorer $database;

    public function __construct(DataEarning $earnedData, Nette\Database\Explorer $database)
    {
        $this->earnedData = $earnedData;
        $this->database = $database;
    }

    public function renderDefault(): void
    {
        $this->template->posts = $this->earnedData
            ->getData()
            ->limit(3);

        $this->template->allPosts = $this->database
            ->table('pages');

        $this->template->allTags = $this->database
            ->table('tags');

        $this->template->usedTags = $this->database
            ->table('used');
    }

    public function handleSave($mark){
        $var = false;
        $controll = $this->database
            ->table('tags');

        foreach ($controll as $property) {
            if ($property->Tag == $mark) {
                $var = true;
            }
        }

        if ($var != true){
            $this->database->query('INSERT INTO tags ?', [
                'Tag' => $mark,
            ]);
        } else {
            $this->database->query('DELETE FROM tags WHERE ?', [
                'Tag' => $mark,
            ]);
            $this->database->query('DELETE FROM used WHERE ?', [
                'tag' => $mark,
            ]);
        }
    }
}
