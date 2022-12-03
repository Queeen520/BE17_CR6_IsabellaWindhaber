<?php

namespace App\Form;

use App\Entity\EventList;
use App\Service\FileUploader;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;


class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Event Name"]])
            ->add('start', DateTimeType::class, ["label" => "Date and Time of the Event", "attr" => ["class" => "form-control mb-2"]])
            ->add('description', TextareaType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "A short description"]])
            ->add('capacity', NumberType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "How many people can join"]])
            ->add('email', EmailType::class, ["label" => "E-Mail for customer requests", "attr" => ["class" => "form-control mb-2", "placeholder" => "Contact email"]])
            ->add('phone', NumberType::class, ["label" => "Phone Nr. for customer requests", "attr" => ["class" => "form-control mb-2", "placeholder" => "Contact phone number"]])
            ->add('street', TextType::class, ["label" => "Street Name + House Nr.", "attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - Streetname + number"]])
            ->add('zip', NumberType::class, ["label" => "ZIP / Postal Code", "attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - ZIP/Postal code"]])
            ->add('city', TextType::class, ["label" => "City", "attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - city name"]])
            ->add('url', UrlType::class, ["label" => "Official Website from organizer", "attr" => ["class" => "form-control mb-2", "placeholder" => "URL"]])
            ->add('type', ChoiceType::class, [
                "label" => "What kind of event is it?",
                'choices'  => [
                    'music' => "music",
                    'sport' => "sport",
                    'food' => "food"
                ]
            ], ["attr" => ["class" => "form-control mb-2"]])

            ->add('picture', FileType::class, [
                "attr" => ["class" => "form-control mb-2"],
                'label' => 'Image',
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new File([
                        'maxSize' => '4048k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpg',
                            'image/jpeg',
                        ],
                        'mimeTypesMessage' => 'Please upload a picture',
                    ])
                ]
            ])
            ->add('Create', SubmitType::class, ["attr" => ["class" => "btn btn-primary"]]);
    }


    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => EventList::class
        ]);
    }
}
